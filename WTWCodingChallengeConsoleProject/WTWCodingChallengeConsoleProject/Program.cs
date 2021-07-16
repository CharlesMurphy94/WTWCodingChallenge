using System;
using System.Collections.Generic;

namespace WTWCodingChallengeConsoleProject
{


    public class Solution
    {
        public static void Main()
        {
            //Test Unique Emails
            string[] uniqueEmailTests = new string[] {
                "cwmurphy7@gmail.com",
                "cw.murphy7@gmail.com",
                "cwmurphy7+cwmurphy7@gmail.com",
                "cwmurphy7@gmail+aol.com"
            };
            Console.WriteLine("Unique Email Count: " + UniqueEmailAddresses.NumberOfUniqueEmailAddresses(uniqueEmailTests));

            //Play Tic Tac Toe
            

            TicTacToe.PlayGame();
            

        }
    }
    public class UniqueEmailAddresses
    {
        
        public static int NumberOfUniqueEmailAddresses(string[] emails) {
            // Create a list of unique stripped emails to compare against
            List<string> uniqueStrippedEmails = new List<string>();
            for (var i = 0; i < emails.Length; i++)
            {
                // Strip periods and remove anything after plus sign in local part
                string localPart = emails[i].Split('@')[0].Split('+')[0].Replace(".", "");
                // Add to unique list if not already there
                if(!uniqueStrippedEmails.Contains(localPart + "@" + emails[i].Split('@')[1]))
                {
                    uniqueStrippedEmails.Add(localPart + "@" + emails[i].Split('@')[1]);
                }
            }

            return uniqueStrippedEmails.Count;
        }


    }
    public class TicTacToe
    {
        /// <summary>
        /// Game Controller 
        /// </summary>
        ///
        public static void PlayGame()
        {
            Console.WriteLine("Welcome to TicTacToe. How many rows would you like to play with?");
            Rows = Int32.Parse(Console.ReadLine());
            CreateBoard(Rows);
            PrintBoard();

            int gameStatus = 0;
            int currentPlayer = 1;

            while (gameStatus == 0)
            {
                Console.WriteLine("Player " + currentPlayer + " Make A Move. Ex: '1,1' is top left, '1,2' is to its right");
                string[] rowCol = Console.ReadLine().Split(',');
                gameStatus = PlacePiece(Int32.Parse(rowCol[0]), Int32.Parse(rowCol[1]), currentPlayer);
                if(gameStatus == 0) currentPlayer = currentPlayer == 1 ? 2 : 1;
            }
            Console.WriteLine("Player " + currentPlayer + " Wins!");
        }

        // Initialize Board object to keep track of moves and Rows variable to use for move checking.
        public static int[,] Board;
        public static int Rows;

        /// <summary>
        /// Create a Tic Tac Tow game board
        /// </summary>
        /// <param name="n">nxn dimension for the game board</param>
        ///
        public static int[,] CreateBoard(int n)
        {
            // Create board
            Board = new int[n, n];

            return Board;
            
        }

        /// <summary>
        /// Place a piece on the game board
        /// </summary>
        /// <param name="row">row to place a piece</param>
        /// <param name="col">column to place a piece</param>
        /// <param name="player">the player (1 or 2) the piece is for</param>
        /// <returns>0 = no winner, 1 = player 1 won, 2 = player 2 won</returns>
        public static int PlacePiece(int row, int col, int player)
        {
            
            Board[row - 1, col - 1] = player;
            bool gameWonHori = true;
            bool gameWonVert = true;
            bool gameWonDiag1 = true;
            bool gameWonDiag2 = true;
            PrintBoard();
            //check lines that move is on for winner
            for (var i = 0; i < Rows; i++)
            {
                if (Board[row - 1, i] != player) gameWonHori = false;
                if (Board[col - 1, i] != player) gameWonVert = false;
                if (Board[i, i] != player) gameWonDiag1 = false;
                if (Board[i, Rows - 1 - i] != player) gameWonDiag2 = false;
            }
            if (gameWonHori || gameWonVert || gameWonDiag1 || gameWonDiag2) return player;
            else return 0;
        }

        // Print Board matrix to console for playability.
        public static void PrintBoard()
        {
            for (int i = 0; i < Board.GetLength(0); i++)
            {
                for (int j = 0; j < Board.GetLength(1); j++)
                {
                    Console.Write(Board[i, j] + "\t");
                }
                Console.WriteLine();
            }
        }
    }

}
