const supabaseUrl = "https://vleupijgimmgtsrqjbid.supabase.co";
const supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZsZXVwaWpnaW1tZ3RzcnFqYmlkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODUwNzUzNTIsImV4cCI6MjEwMDY1MTM1Mn0.qo3nqS04DLGmKAM-wtQpuYK5uxp_hDKfVycNmRNfjm0";

export const supabase = window.supabase.createClient(supabaseUrl, supabaseKey);